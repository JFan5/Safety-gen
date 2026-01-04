(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_05 - type_1
obj_12 obj_10 obj_11 obj_01 - type_2
obj_14 obj_06 obj_03 obj_09 - type_3
obj_08 obj_02 obj_13 obj_07 - object)
(:init
(pred_2 obj_04 obj_14)
(pred_3 obj_04 obj_12)
(pred_3 obj_04 obj_10)
(pred_2 obj_05 obj_06)
(pred_3 obj_05 obj_11)
(pred_3 obj_05 obj_01)
(pred_1 obj_08 obj_03)
(pred_1 obj_02 obj_14)
(pred_1 obj_13 obj_03)
(pred_1 obj_07 obj_09)
)
(:goal
(and
(pred_1 obj_08 obj_14)
(pred_1 obj_02 obj_14)
(pred_1 obj_13 obj_03)
(pred_1 obj_07 obj_14)
)
)

(:constraints
  (always (not (pred_2 obj_04 obj_03)))
)
)