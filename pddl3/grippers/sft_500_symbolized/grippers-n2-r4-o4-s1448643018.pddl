(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_01 - type_2
obj_07 obj_14 obj_11 obj_06 - type_1
obj_05 obj_12 obj_02 obj_09 - type_3
obj_13 obj_04 obj_10 obj_03 - object)
(:init
(pred_1 obj_08 obj_12)
(pred_4 obj_08 obj_07)
(pred_4 obj_08 obj_14)
(pred_1 obj_01 obj_09)
(pred_4 obj_01 obj_11)
(pred_4 obj_01 obj_06)
(pred_3 obj_13 obj_09)
(pred_3 obj_04 obj_02)
(pred_3 obj_10 obj_02)
(pred_3 obj_03 obj_05)
)
(:goal
(and
(pred_3 obj_13 obj_05)
(pred_3 obj_04 obj_09)
(pred_3 obj_10 obj_12)
(pred_3 obj_03 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_08 obj_12) (pred_1 obj_01 obj_12))))
    (always (not (and (pred_1 obj_08 obj_09) (pred_1 obj_01 obj_09))))
  )
)
)