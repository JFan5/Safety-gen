(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_02 - type_2
obj_11 obj_12 obj_01 obj_07 - type_1
obj_10 obj_03 obj_09 - type_3
obj_05 obj_06 obj_08 - object)
(:init
(pred_1 obj_04 obj_10)
(pred_4 obj_04 obj_11)
(pred_4 obj_04 obj_12)
(pred_1 obj_02 obj_10)
(pred_4 obj_02 obj_01)
(pred_4 obj_02 obj_07)
(pred_2 obj_05 obj_10)
(pred_2 obj_06 obj_03)
(pred_2 obj_08 obj_10)
)
(:goal
(and
(pred_2 obj_05 obj_03)
(pred_2 obj_06 obj_09)
(pred_2 obj_08 obj_10)
)
)

(:constraints
  (always (not (pred_1 obj_04 obj_09)))
)
)