(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_04 obj_13 - type_1
obj_11 obj_12 obj_05 obj_01 - type_3
obj_08 obj_02 obj_09 obj_07 - type_2
obj_03 obj_06 obj_10 - object)
(:init
(pred_3 obj_04 obj_09)
(pred_4 obj_04 obj_11)
(pred_4 obj_04 obj_12)
(pred_3 obj_13 obj_08)
(pred_4 obj_13 obj_05)
(pred_4 obj_13 obj_01)
(pred_2 obj_03 obj_08)
(pred_2 obj_06 obj_07)
(pred_2 obj_10 obj_08)
)
(:goal
(and
(pred_2 obj_03 obj_07)
(pred_2 obj_06 obj_08)
(pred_2 obj_10 obj_07)
)
)

(:constraints
  (always (not (pred_3 obj_04 obj_07)))
)
)