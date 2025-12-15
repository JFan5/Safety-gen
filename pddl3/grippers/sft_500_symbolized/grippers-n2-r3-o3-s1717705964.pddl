(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_02 - type_1
obj_11 obj_01 obj_07 obj_06 - type_2
obj_08 obj_12 obj_03 - type_3
obj_04 obj_09 obj_10 - object)
(:init
(pred_1 obj_05 obj_12)
(pred_4 obj_05 obj_11)
(pred_4 obj_05 obj_01)
(pred_1 obj_02 obj_12)
(pred_4 obj_02 obj_07)
(pred_4 obj_02 obj_06)
(pred_3 obj_04 obj_03)
(pred_3 obj_09 obj_12)
(pred_3 obj_10 obj_12)
)
(:goal
(and
(pred_3 obj_04 obj_12)
(pred_3 obj_09 obj_08)
(pred_3 obj_10 obj_03)
)
)

(:constraints
  (always (not (pred_1 obj_05 obj_03)))
)
)