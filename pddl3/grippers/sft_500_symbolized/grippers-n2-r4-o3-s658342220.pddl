(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_04 - type_1
obj_13 obj_12 obj_02 obj_08 - type_2
obj_03 obj_09 obj_07 obj_10 - type_3
obj_06 obj_01 obj_05 - object)
(:init
(pred_1 obj_11 obj_09)
(pred_3 obj_11 obj_13)
(pred_3 obj_11 obj_12)
(pred_1 obj_04 obj_10)
(pred_3 obj_04 obj_02)
(pred_3 obj_04 obj_08)
(pred_2 obj_06 obj_07)
(pred_2 obj_01 obj_07)
(pred_2 obj_05 obj_09)
)
(:goal
(and
(pred_2 obj_06 obj_09)
(pred_2 obj_01 obj_03)
(pred_2 obj_05 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_11 obj_09) (pred_1 obj_04 obj_09))))
    (always (not (and (pred_1 obj_11 obj_07) (pred_1 obj_04 obj_07))))
  )
)
)