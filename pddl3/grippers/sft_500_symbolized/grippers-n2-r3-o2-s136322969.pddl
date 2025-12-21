(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_02 obj_07 - type_1
obj_06 obj_01 obj_09 obj_04 - type_2
obj_11 obj_03 obj_08 - type_3
obj_10 obj_05 - object)
(:init
(pred_1 obj_02 obj_11)
(pred_3 obj_02 obj_06)
(pred_3 obj_02 obj_01)
(pred_1 obj_07 obj_03)
(pred_3 obj_07 obj_09)
(pred_3 obj_07 obj_04)
(pred_2 obj_10 obj_03)
(pred_2 obj_05 obj_08)
)
(:goal
(and
(pred_2 obj_10 obj_11)
(pred_2 obj_05 obj_03)
)
)

(:constraints
  (always (not (pred_1 obj_02 obj_08)))
)
)