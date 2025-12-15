(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_03 obj_02 - type_1
obj_01 obj_10 obj_07 obj_11 - type_3
obj_05 obj_12 obj_08 - type_2
obj_04 obj_09 obj_06 - object)
(:init
(pred_3 obj_03 obj_12)
(pred_4 obj_03 obj_01)
(pred_4 obj_03 obj_10)
(pred_3 obj_02 obj_05)
(pred_4 obj_02 obj_07)
(pred_4 obj_02 obj_11)
(pred_2 obj_04 obj_05)
(pred_2 obj_09 obj_08)
(pred_2 obj_06 obj_08)
)
(:goal
(and
(pred_2 obj_04 obj_08)
(pred_2 obj_09 obj_08)
(pred_2 obj_06 obj_05)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_08)))
)
)