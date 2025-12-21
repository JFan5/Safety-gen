(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_03 - type_1
obj_01 obj_11 obj_08 obj_04 - type_3
obj_05 obj_06 obj_07 - type_2
obj_02 obj_12 obj_10 - object)
(:init
(pred_4 obj_09 obj_05)
(pred_2 obj_09 obj_01)
(pred_2 obj_09 obj_11)
(pred_4 obj_03 obj_07)
(pred_2 obj_03 obj_08)
(pred_2 obj_03 obj_04)
(pred_3 obj_02 obj_05)
(pred_3 obj_12 obj_05)
(pred_3 obj_10 obj_06)
)
(:goal
(and
(pred_3 obj_02 obj_05)
(pred_3 obj_12 obj_07)
(pred_3 obj_10 obj_05)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_07)))
)
)