(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_03 - type_1
obj_04 obj_06 - type_3
obj_08 obj_09 obj_07 obj_10 - type_2
obj_01 obj_02 obj_05 - object)
(:init
(pred_3 obj_03 obj_09)
(pred_4 obj_03 obj_04)
(pred_4 obj_03 obj_06)
(pred_2 obj_01 obj_09)
(pred_2 obj_02 obj_08)
(pred_2 obj_05 obj_09)
)
(:goal
(and
(pred_2 obj_01 obj_10)
(pred_2 obj_02 obj_09)
(pred_2 obj_05 obj_08)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_03 ?b obj_06))))
)
)