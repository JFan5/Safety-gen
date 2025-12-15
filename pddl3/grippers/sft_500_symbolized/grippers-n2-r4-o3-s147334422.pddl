(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_11 - type_1
obj_13 obj_03 obj_02 obj_06 - type_3
obj_08 obj_10 obj_05 obj_09 - type_2
obj_07 obj_12 obj_04 - object)
(:init
(pred_3 obj_01 obj_05)
(pred_1 obj_01 obj_13)
(pred_1 obj_01 obj_03)
(pred_3 obj_11 obj_09)
(pred_1 obj_11 obj_02)
(pred_1 obj_11 obj_06)
(pred_4 obj_07 obj_10)
(pred_4 obj_12 obj_08)
(pred_4 obj_04 obj_08)
)
(:goal
(and
(pred_4 obj_07 obj_05)
(pred_4 obj_12 obj_05)
(pred_4 obj_04 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_01 obj_05) (pred_3 obj_11 obj_05))))
    (always (not (and (pred_3 obj_01 obj_09) (pred_3 obj_11 obj_09))))
  )
)
)