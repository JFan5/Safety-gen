(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_06 obj_07 - type_3
obj_04 obj_03 obj_11 obj_01 - type_1
obj_09 obj_08 obj_10 - type_2
obj_02 obj_05 - object)
(:init
(pred_1 obj_06 obj_09)
(pred_3 obj_06 obj_04)
(pred_3 obj_06 obj_03)
(pred_1 obj_07 obj_09)
(pred_3 obj_07 obj_11)
(pred_3 obj_07 obj_01)
(pred_4 obj_02 obj_09)
(pred_4 obj_05 obj_10)
)
(:goal
(and
(pred_4 obj_02 obj_09)
(pred_4 obj_05 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_06 obj_10)))
)
)