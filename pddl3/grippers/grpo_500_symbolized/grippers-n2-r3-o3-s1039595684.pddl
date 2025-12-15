(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_07 - type_1
obj_06 obj_12 obj_03 obj_10 - type_3
obj_05 obj_11 obj_04 - type_2
obj_09 obj_01 obj_02 - object)
(:init
(pred_3 obj_08 obj_04)
(pred_4 obj_08 obj_06)
(pred_4 obj_08 obj_12)
(pred_3 obj_07 obj_04)
(pred_4 obj_07 obj_03)
(pred_4 obj_07 obj_10)
(pred_2 obj_09 obj_11)
(pred_2 obj_01 obj_11)
(pred_2 obj_02 obj_04)
)
(:goal
(and
(pred_2 obj_09 obj_04)
(pred_2 obj_01 obj_11)
(pred_2 obj_02 obj_05)
)
)

(:constraints
  (always (not (pred_3 obj_08 obj_05)))
)
)