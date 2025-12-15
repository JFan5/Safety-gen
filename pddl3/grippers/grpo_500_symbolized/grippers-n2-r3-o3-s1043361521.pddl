(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_10 - type_1
obj_08 obj_12 obj_09 obj_04 - type_3
obj_01 obj_03 obj_11 - type_2
obj_07 obj_02 obj_05 - object)
(:init
(pred_3 obj_06 obj_03)
(pred_4 obj_06 obj_08)
(pred_4 obj_06 obj_12)
(pred_3 obj_10 obj_11)
(pred_4 obj_10 obj_09)
(pred_4 obj_10 obj_04)
(pred_2 obj_07 obj_01)
(pred_2 obj_02 obj_01)
(pred_2 obj_05 obj_01)
)
(:goal
(and
(pred_2 obj_07 obj_11)
(pred_2 obj_02 obj_11)
(pred_2 obj_05 obj_11)
)
)

(:constraints
  (always (not (pred_3 obj_06 obj_11)))
)
)