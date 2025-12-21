(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_02 - type_1
obj_01 obj_12 obj_09 obj_04 - type_3
obj_10 obj_11 obj_08 - type_2
obj_06 obj_05 obj_03 - object)
(:init
(pred_4 obj_07 obj_08)
(pred_2 obj_07 obj_01)
(pred_2 obj_07 obj_12)
(pred_4 obj_02 obj_08)
(pred_2 obj_02 obj_09)
(pred_2 obj_02 obj_04)
(pred_3 obj_06 obj_08)
(pred_3 obj_05 obj_11)
(pred_3 obj_03 obj_08)
)
(:goal
(and
(pred_3 obj_06 obj_08)
(pred_3 obj_05 obj_11)
(pred_3 obj_03 obj_10)
)
)

(:constraints
  (always (not (pred_4 obj_07 obj_10)))
)
)