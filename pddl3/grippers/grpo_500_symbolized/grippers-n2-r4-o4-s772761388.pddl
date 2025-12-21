(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_09 - type_1
obj_11 obj_14 obj_10 obj_02 - type_3
obj_13 obj_01 obj_03 obj_08 - type_2
obj_05 obj_07 obj_04 obj_06 - object)
(:init
(pred_4 obj_12 obj_08)
(pred_2 obj_12 obj_11)
(pred_2 obj_12 obj_14)
(pred_4 obj_09 obj_08)
(pred_2 obj_09 obj_10)
(pred_2 obj_09 obj_02)
(pred_3 obj_05 obj_03)
(pred_3 obj_07 obj_03)
(pred_3 obj_04 obj_01)
(pred_3 obj_06 obj_01)
)
(:goal
(and
(pred_3 obj_05 obj_08)
(pred_3 obj_07 obj_13)
(pred_3 obj_04 obj_08)
(pred_3 obj_06 obj_13)
)
)

(:constraints
  (always (not (pred_4 obj_12 obj_03)))
)
)