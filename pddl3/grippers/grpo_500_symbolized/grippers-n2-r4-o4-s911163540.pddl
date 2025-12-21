(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_14 - type_1
obj_04 obj_01 obj_12 obj_13 - type_3
obj_11 obj_07 obj_08 obj_10 - type_2
obj_05 obj_02 obj_06 obj_09 - object)
(:init
(pred_4 obj_03 obj_08)
(pred_2 obj_03 obj_04)
(pred_2 obj_03 obj_01)
(pred_4 obj_14 obj_07)
(pred_2 obj_14 obj_12)
(pred_2 obj_14 obj_13)
(pred_3 obj_05 obj_11)
(pred_3 obj_02 obj_10)
(pred_3 obj_06 obj_11)
(pred_3 obj_09 obj_11)
)
(:goal
(and
(pred_3 obj_05 obj_10)
(pred_3 obj_02 obj_08)
(pred_3 obj_06 obj_11)
(pred_3 obj_09 obj_08)
)
)

(:constraints
  (always (not (pred_4 obj_03 obj_10)))
)
)