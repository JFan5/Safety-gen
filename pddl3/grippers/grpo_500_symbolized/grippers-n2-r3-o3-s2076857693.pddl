(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_03 - type_1
obj_01 obj_09 obj_07 obj_08 - type_3
obj_05 obj_04 obj_10 - type_2
obj_12 obj_11 obj_06 - object)
(:init
(pred_3 obj_02 obj_10)
(pred_4 obj_02 obj_01)
(pred_4 obj_02 obj_09)
(pred_3 obj_03 obj_05)
(pred_4 obj_03 obj_07)
(pred_4 obj_03 obj_08)
(pred_2 obj_12 obj_10)
(pred_2 obj_11 obj_05)
(pred_2 obj_06 obj_10)
)
(:goal
(and
(pred_2 obj_12 obj_04)
(pred_2 obj_11 obj_05)
(pred_2 obj_06 obj_10)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_04)))
)
)