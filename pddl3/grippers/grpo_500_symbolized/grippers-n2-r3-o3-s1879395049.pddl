(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_03 obj_11 - type_1
obj_06 obj_04 obj_08 obj_02 - type_3
obj_12 obj_10 obj_09 - type_2
obj_05 obj_07 obj_01 - object)
(:init
(pred_3 obj_03 obj_10)
(pred_4 obj_03 obj_06)
(pred_4 obj_03 obj_04)
(pred_3 obj_11 obj_12)
(pred_4 obj_11 obj_08)
(pred_4 obj_11 obj_02)
(pred_2 obj_05 obj_09)
(pred_2 obj_07 obj_12)
(pred_2 obj_01 obj_09)
)
(:goal
(and
(pred_2 obj_05 obj_12)
(pred_2 obj_07 obj_12)
(pred_2 obj_01 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_03 obj_09) (pred_3 obj_11 obj_09))))
  )
)
)