(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_14 - type_1
obj_07 obj_04 obj_12 obj_01 - type_3
obj_05 obj_11 obj_03 obj_06 - type_2
obj_02 obj_13 obj_08 obj_09 - object)
(:init
(pred_1 obj_10 obj_11)
(pred_4 obj_10 obj_07)
(pred_4 obj_10 obj_04)
(pred_1 obj_14 obj_03)
(pred_4 obj_14 obj_12)
(pred_4 obj_14 obj_01)
(pred_3 obj_02 obj_05)
(pred_3 obj_13 obj_03)
(pred_3 obj_08 obj_05)
(pred_3 obj_09 obj_06)
)
(:goal
(and
(pred_3 obj_02 obj_05)
(pred_3 obj_13 obj_11)
(pred_3 obj_08 obj_03)
(pred_3 obj_09 obj_03)
)
)

(:constraints
  (always (not (pred_1 obj_10 obj_03)))
)
)