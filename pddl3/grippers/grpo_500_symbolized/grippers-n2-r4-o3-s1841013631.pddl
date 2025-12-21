(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_12 - type_1
obj_10 obj_09 obj_13 obj_11 - type_3
obj_02 obj_03 obj_01 obj_08 - type_2
obj_05 obj_04 obj_06 - object)
(:init
(pred_4 obj_07 obj_02)
(pred_2 obj_07 obj_10)
(pred_2 obj_07 obj_09)
(pred_4 obj_12 obj_08)
(pred_2 obj_12 obj_13)
(pred_2 obj_12 obj_11)
(pred_3 obj_05 obj_01)
(pred_3 obj_04 obj_08)
(pred_3 obj_06 obj_03)
)
(:goal
(and
(pred_3 obj_05 obj_02)
(pred_3 obj_04 obj_08)
(pred_3 obj_06 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_07 obj_01)))
)
)