(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_04 - type_2
obj_01 obj_12 obj_11 obj_05 - type_1
obj_09 obj_08 obj_03 obj_14 - type_3
obj_07 obj_06 obj_10 obj_13 - object)
(:init
(pred_1 obj_02 obj_08)
(pred_4 obj_02 obj_01)
(pred_4 obj_02 obj_12)
(pred_1 obj_04 obj_08)
(pred_4 obj_04 obj_11)
(pred_4 obj_04 obj_05)
(pred_3 obj_07 obj_08)
(pred_3 obj_06 obj_03)
(pred_3 obj_10 obj_14)
(pred_3 obj_13 obj_09)
)
(:goal
(and
(pred_3 obj_07 obj_08)
(pred_3 obj_06 obj_03)
(pred_3 obj_10 obj_03)
(pred_3 obj_13 obj_08)
)
)

(:constraints
  (always (not (pred_1 obj_02 obj_03)))
)
)