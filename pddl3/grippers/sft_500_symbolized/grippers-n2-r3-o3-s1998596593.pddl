(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_12 - type_3
obj_01 obj_08 obj_11 obj_07 - type_2
obj_03 obj_02 obj_04 - type_1
obj_10 obj_06 obj_09 - object)
(:init
(pred_2 obj_05 obj_03)
(pred_1 obj_05 obj_01)
(pred_1 obj_05 obj_08)
(pred_2 obj_12 obj_03)
(pred_1 obj_12 obj_11)
(pred_1 obj_12 obj_07)
(pred_4 obj_10 obj_02)
(pred_4 obj_06 obj_02)
(pred_4 obj_09 obj_03)
)
(:goal
(and
(pred_4 obj_10 obj_03)
(pred_4 obj_06 obj_04)
(pred_4 obj_09 obj_03)
)
)

(:constraints
  (always (not (pred_2 obj_05 obj_04)))
)
)