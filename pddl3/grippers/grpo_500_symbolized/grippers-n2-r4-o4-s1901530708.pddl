(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_08 - type_1
obj_13 obj_12 obj_06 obj_10 - type_3
obj_11 obj_03 obj_01 obj_14 - type_2
obj_07 obj_09 obj_04 obj_05 - object)
(:init
(pred_4 obj_02 obj_01)
(pred_2 obj_02 obj_13)
(pred_2 obj_02 obj_12)
(pred_4 obj_08 obj_01)
(pred_2 obj_08 obj_06)
(pred_2 obj_08 obj_10)
(pred_3 obj_07 obj_01)
(pred_3 obj_09 obj_11)
(pred_3 obj_04 obj_03)
(pred_3 obj_05 obj_01)
)
(:goal
(and
(pred_3 obj_07 obj_01)
(pred_3 obj_09 obj_14)
(pred_3 obj_04 obj_14)
(pred_3 obj_05 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_02 obj_14)))
)
)