(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_03 obj_01 - type_1
obj_10 obj_02 obj_07 obj_11 - type_2
obj_05 obj_09 obj_04 - type_3
obj_08 obj_06 - object)
(:init
(pred_3 obj_03 obj_04)
(pred_4 obj_03 obj_10)
(pred_4 obj_03 obj_02)
(pred_3 obj_01 obj_04)
(pred_4 obj_01 obj_07)
(pred_4 obj_01 obj_11)
(pred_2 obj_08 obj_04)
(pred_2 obj_06 obj_05)
)
(:goal
(and
(pred_2 obj_08 obj_05)
(pred_2 obj_06 obj_05)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_05)))
)
)