(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_05 - type_2
obj_10 obj_02 obj_01 obj_11 - type_3
obj_08 obj_04 obj_07 - type_1
obj_03 obj_12 obj_09 - object)
(:init
(pred_4 obj_06 obj_08)
(pred_1 obj_06 obj_10)
(pred_1 obj_06 obj_02)
(pred_4 obj_05 obj_08)
(pred_1 obj_05 obj_01)
(pred_1 obj_05 obj_11)
(pred_2 obj_03 obj_04)
(pred_2 obj_12 obj_08)
(pred_2 obj_09 obj_04)
)
(:goal
(and
(pred_2 obj_03 obj_04)
(pred_2 obj_12 obj_08)
(pred_2 obj_09 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_06 obj_07)))
)
)