(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_05 - type_1
obj_12 obj_08 obj_11 obj_09 - type_3
obj_06 obj_04 obj_07 obj_03 - type_2
obj_02 obj_13 obj_01 - object)
(:init
(pred_4 obj_10 obj_06)
(pred_2 obj_10 obj_12)
(pred_2 obj_10 obj_08)
(pred_4 obj_05 obj_06)
(pred_2 obj_05 obj_11)
(pred_2 obj_05 obj_09)
(pred_3 obj_02 obj_04)
(pred_3 obj_13 obj_04)
(pred_3 obj_01 obj_06)
)
(:goal
(and
(pred_3 obj_02 obj_07)
(pred_3 obj_13 obj_06)
(pred_3 obj_01 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_07)))
)
)