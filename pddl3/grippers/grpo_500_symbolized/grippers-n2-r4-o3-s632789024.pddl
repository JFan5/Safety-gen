(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_12 - type_1
obj_03 obj_09 obj_13 obj_10 - type_3
obj_01 obj_04 obj_07 obj_08 - type_2
obj_05 obj_02 obj_11 - object)
(:init
(pred_3 obj_06 obj_08)
(pred_4 obj_06 obj_03)
(pred_4 obj_06 obj_09)
(pred_3 obj_12 obj_07)
(pred_4 obj_12 obj_13)
(pred_4 obj_12 obj_10)
(pred_2 obj_05 obj_08)
(pred_2 obj_02 obj_07)
(pred_2 obj_11 obj_07)
)
(:goal
(and
(pred_2 obj_05 obj_07)
(pred_2 obj_02 obj_01)
(pred_2 obj_11 obj_07)
)
)

(:constraints
  (always (not (pred_3 obj_06 obj_07)))
)
)