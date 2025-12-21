(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_09 - type_1
obj_04 obj_12 obj_06 obj_02 - type_3
obj_03 obj_01 obj_11 obj_08 - type_2
obj_05 obj_13 obj_07 - object)
(:init
(pred_4 obj_10 obj_03)
(pred_2 obj_10 obj_04)
(pred_2 obj_10 obj_12)
(pred_4 obj_09 obj_03)
(pred_2 obj_09 obj_06)
(pred_2 obj_09 obj_02)
(pred_3 obj_05 obj_01)
(pred_3 obj_13 obj_11)
(pred_3 obj_07 obj_11)
)
(:goal
(and
(pred_3 obj_05 obj_11)
(pred_3 obj_13 obj_01)
(pred_3 obj_07 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_11)))
)
)