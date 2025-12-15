(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_11 - type_3
obj_01 obj_06 obj_02 obj_08 - type_2
obj_13 obj_03 obj_05 obj_12 - type_1
obj_07 obj_04 obj_09 - object)
(:init
(pred_4 obj_10 obj_05)
(pred_1 obj_10 obj_01)
(pred_1 obj_10 obj_06)
(pred_4 obj_11 obj_12)
(pred_1 obj_11 obj_02)
(pred_1 obj_11 obj_08)
(pred_3 obj_07 obj_03)
(pred_3 obj_04 obj_12)
(pred_3 obj_09 obj_12)
)
(:goal
(and
(pred_3 obj_07 obj_13)
(pred_3 obj_04 obj_12)
(pred_3 obj_09 obj_05)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_03)))
)
)