(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_01 - type_1
obj_04 obj_06 - type_2
obj_09 obj_10 obj_02 obj_05 - type_3
obj_03 obj_08 obj_07 - object)
(:init
(pred_4 obj_01 obj_05)
(pred_2 obj_01 obj_04)
(pred_2 obj_01 obj_06)
(pred_1 obj_03 obj_09)
(pred_1 obj_08 obj_10)
(pred_1 obj_07 obj_05)
)
(:goal
(and
(pred_1 obj_03 obj_10)
(pred_1 obj_08 obj_02)
(pred_1 obj_07 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_01 ?b obj_06))))
)
)