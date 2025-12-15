(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_02 - type_1
obj_09 obj_03 obj_04 obj_12 - type_2
obj_10 obj_07 obj_01 - type_3
obj_11 obj_08 obj_05 - object)
(:init
(pred_3 obj_06 obj_10)
(pred_1 obj_06 obj_09)
(pred_1 obj_06 obj_03)
(pred_3 obj_02 obj_07)
(pred_1 obj_02 obj_04)
(pred_1 obj_02 obj_12)
(pred_4 obj_11 obj_01)
(pred_4 obj_08 obj_07)
(pred_4 obj_05 obj_07)
)
(:goal
(and
(pred_4 obj_11 obj_07)
(pred_4 obj_08 obj_10)
(pred_4 obj_05 obj_07)
)
)

(:constraints
  (always (not (pred_3 obj_06 obj_01)))
)
)