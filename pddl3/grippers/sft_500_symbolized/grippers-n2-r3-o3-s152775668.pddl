(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_03 - type_3
obj_01 obj_12 obj_05 obj_11 - type_2
obj_07 obj_08 obj_02 - type_1
obj_09 obj_10 obj_06 - object)
(:init
(pred_2 obj_04 obj_07)
(pred_1 obj_04 obj_01)
(pred_1 obj_04 obj_12)
(pred_2 obj_03 obj_02)
(pred_1 obj_03 obj_05)
(pred_1 obj_03 obj_11)
(pred_4 obj_09 obj_02)
(pred_4 obj_10 obj_02)
(pred_4 obj_06 obj_07)
)
(:goal
(and
(pred_4 obj_09 obj_08)
(pred_4 obj_10 obj_07)
(pred_4 obj_06 obj_02)
)
)

(:constraints
  (always (not (pred_2 obj_04 obj_02)))
)
)