(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_03 obj_04 - type_2
obj_09 obj_10 obj_11 obj_02 - type_3
obj_07 obj_08 obj_01 - type_1
obj_05 obj_06 - object)
(:init
(pred_1 obj_03 obj_08)
(pred_4 obj_03 obj_09)
(pred_4 obj_03 obj_10)
(pred_1 obj_04 obj_08)
(pred_4 obj_04 obj_11)
(pred_4 obj_04 obj_02)
(pred_3 obj_05 obj_01)
(pred_3 obj_06 obj_08)
)
(:goal
(and
(pred_3 obj_05 obj_07)
(pred_3 obj_06 obj_01)
)
)

(:constraints
  (always (not (pred_1 obj_03 obj_01)))
)
)