(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_10 - type_3
obj_03 obj_01 obj_11 obj_13 - type_1
obj_08 obj_02 obj_07 obj_04 - type_2
obj_06 obj_12 obj_05 - object)
(:init
(pred_4 obj_09 obj_02)
(pred_1 obj_09 obj_03)
(pred_1 obj_09 obj_01)
(pred_4 obj_10 obj_02)
(pred_1 obj_10 obj_11)
(pred_1 obj_10 obj_13)
(pred_3 obj_06 obj_08)
(pred_3 obj_12 obj_08)
(pred_3 obj_05 obj_02)
)
(:goal
(and
(pred_3 obj_06 obj_07)
(pred_3 obj_12 obj_08)
(pred_3 obj_05 obj_08)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_07)))
)
)