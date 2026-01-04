(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_06 - type_2
obj_10 obj_12 obj_04 obj_11 - type_3
obj_03 obj_02 obj_01 - type_1
obj_07 obj_05 obj_08 - object)
(:init
(pred_1 obj_09 obj_03)
(pred_4 obj_09 obj_10)
(pred_4 obj_09 obj_12)
(pred_1 obj_06 obj_01)
(pred_4 obj_06 obj_04)
(pred_4 obj_06 obj_11)
(pred_3 obj_07 obj_02)
(pred_3 obj_05 obj_02)
(pred_3 obj_08 obj_02)
)
(:goal
(and
(pred_3 obj_07 obj_01)
(pred_3 obj_05 obj_01)
(pred_3 obj_08 obj_03)
)
)

(:constraints
  (always (not (pred_1 obj_09 obj_01)))
)
)