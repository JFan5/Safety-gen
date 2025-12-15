(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_05 - type_2
obj_03 obj_08 obj_01 obj_12 - type_1
obj_02 obj_07 obj_04 - type_3
obj_10 obj_11 obj_09 - object)
(:init
(pred_2 obj_06 obj_07)
(pred_3 obj_06 obj_03)
(pred_3 obj_06 obj_08)
(pred_2 obj_05 obj_02)
(pred_3 obj_05 obj_01)
(pred_3 obj_05 obj_12)
(pred_4 obj_10 obj_02)
(pred_4 obj_11 obj_04)
(pred_4 obj_09 obj_02)
)
(:goal
(and
(pred_4 obj_10 obj_04)
(pred_4 obj_11 obj_07)
(pred_4 obj_09 obj_02)
)
)

(:constraints
  (always (not (pred_2 obj_06 obj_04)))
)
)