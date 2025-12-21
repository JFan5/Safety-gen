(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_06 - type_1
obj_04 obj_03 obj_01 obj_05 - type_3
obj_09 obj_10 obj_12 obj_11 - type_2
obj_14 obj_07 obj_13 obj_08 - object)
(:init
(pred_4 obj_02 obj_11)
(pred_2 obj_02 obj_04)
(pred_2 obj_02 obj_03)
(pred_4 obj_06 obj_09)
(pred_2 obj_06 obj_01)
(pred_2 obj_06 obj_05)
(pred_3 obj_14 obj_12)
(pred_3 obj_07 obj_10)
(pred_3 obj_13 obj_12)
(pred_3 obj_08 obj_12)
)
(:goal
(and
(pred_3 obj_14 obj_09)
(pred_3 obj_07 obj_09)
(pred_3 obj_13 obj_11)
(pred_3 obj_08 obj_10)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_02 obj_09) (pred_4 obj_06 obj_09))))
    (always (not (and (pred_4 obj_02 obj_12) (pred_4 obj_06 obj_12))))
  )
)
)