(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_02 - type_2
obj_12 obj_06 obj_01 obj_10 - type_3
obj_07 obj_05 obj_04 - type_1
obj_11 obj_03 obj_09 - object)
(:init
(pred_2 obj_08 obj_05)
(pred_3 obj_08 obj_12)
(pred_3 obj_08 obj_06)
(pred_2 obj_02 obj_05)
(pred_3 obj_02 obj_01)
(pred_3 obj_02 obj_10)
(pred_4 obj_11 obj_07)
(pred_4 obj_03 obj_07)
(pred_4 obj_09 obj_07)
)
(:goal
(and
(pred_4 obj_11 obj_05)
(pred_4 obj_03 obj_04)
(pred_4 obj_09 obj_07)
)
)

(:constraints
  (always (not (pred_2 obj_08 obj_04)))
)
)