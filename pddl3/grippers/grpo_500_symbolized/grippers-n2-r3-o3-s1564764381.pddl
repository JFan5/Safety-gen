(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_06 - type_1
obj_04 obj_01 obj_12 obj_02 - type_3
obj_08 obj_03 obj_11 - type_2
obj_10 obj_05 obj_07 - object)
(:init
(pred_3 obj_09 obj_03)
(pred_4 obj_09 obj_04)
(pred_4 obj_09 obj_01)
(pred_3 obj_06 obj_08)
(pred_4 obj_06 obj_12)
(pred_4 obj_06 obj_02)
(pred_2 obj_10 obj_08)
(pred_2 obj_05 obj_08)
(pred_2 obj_07 obj_11)
)
(:goal
(and
(pred_2 obj_10 obj_08)
(pred_2 obj_05 obj_03)
(pred_2 obj_07 obj_03)
)
)

(:constraints
  (always (not (pred_3 obj_09 obj_11)))
)
)