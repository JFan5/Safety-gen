(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_10 obj_05 - type_1
obj_01 obj_04 obj_09 obj_03 - type_3
obj_08 obj_11 obj_06 - type_2
obj_07 obj_02 - object)
(:init
(pred_4 obj_10 obj_06)
(pred_2 obj_10 obj_01)
(pred_2 obj_10 obj_04)
(pred_4 obj_05 obj_06)
(pred_2 obj_05 obj_09)
(pred_2 obj_05 obj_03)
(pred_3 obj_07 obj_06)
(pred_3 obj_02 obj_11)
)
(:goal
(and
(pred_3 obj_07 obj_08)
(pred_3 obj_02 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_08)))
)
)