(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_12 - type_3
obj_06 obj_05 obj_04 obj_08 - type_1
obj_10 obj_09 obj_11 - type_2
obj_03 obj_07 obj_01 - object)
(:init
(pred_1 obj_02 obj_10)
(pred_4 obj_02 obj_06)
(pred_4 obj_02 obj_05)
(pred_1 obj_12 obj_10)
(pred_4 obj_12 obj_04)
(pred_4 obj_12 obj_08)
(pred_3 obj_03 obj_10)
(pred_3 obj_07 obj_10)
(pred_3 obj_01 obj_11)
)
(:goal
(and
(pred_3 obj_03 obj_09)
(pred_3 obj_07 obj_11)
(pred_3 obj_01 obj_11)
)
)

(:constraints
  (always (not (pred_1 obj_02 obj_11)))
)
)