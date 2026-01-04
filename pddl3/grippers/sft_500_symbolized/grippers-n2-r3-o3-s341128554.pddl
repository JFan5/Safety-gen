(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_09 - type_2
obj_06 obj_04 obj_10 obj_03 - type_1
obj_02 obj_11 obj_01 - type_3
obj_05 obj_12 obj_07 - object)
(:init
(pred_1 obj_08 obj_01)
(pred_2 obj_08 obj_06)
(pred_2 obj_08 obj_04)
(pred_1 obj_09 obj_02)
(pred_2 obj_09 obj_10)
(pred_2 obj_09 obj_03)
(pred_3 obj_05 obj_11)
(pred_3 obj_12 obj_02)
(pred_3 obj_07 obj_02)
)
(:goal
(and
(pred_3 obj_05 obj_02)
(pred_3 obj_12 obj_02)
(pred_3 obj_07 obj_01)
)
)

(:constraints
  (always (not (pred_1 obj_08 obj_11)))
)
)