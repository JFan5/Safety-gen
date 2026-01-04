(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_07 - type_3
obj_04 obj_06 - type_2
obj_01 obj_10 obj_02 obj_09 - type_1
obj_08 obj_03 obj_05 - object)
(:init
(pred_4 obj_07 obj_02)
(pred_3 obj_07 obj_04)
(pred_3 obj_07 obj_06)
(pred_2 obj_08 obj_09)
(pred_2 obj_03 obj_10)
(pred_2 obj_05 obj_02)
)
(:goal
(and
(pred_2 obj_08 obj_09)
(pred_2 obj_03 obj_10)
(pred_2 obj_05 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_07 ?b obj_06))))
)
)