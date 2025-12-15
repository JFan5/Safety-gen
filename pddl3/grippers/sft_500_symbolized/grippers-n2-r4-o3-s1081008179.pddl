(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_05 - type_3
obj_04 obj_13 obj_11 obj_07 - type_2
obj_12 obj_08 obj_06 obj_09 - type_1
obj_01 obj_10 obj_02 - object)
(:init
(pred_1 obj_03 obj_08)
(pred_3 obj_03 obj_04)
(pred_3 obj_03 obj_13)
(pred_1 obj_05 obj_09)
(pred_3 obj_05 obj_11)
(pred_3 obj_05 obj_07)
(pred_2 obj_01 obj_12)
(pred_2 obj_10 obj_08)
(pred_2 obj_02 obj_09)
)
(:goal
(and
(pred_2 obj_01 obj_09)
(pred_2 obj_10 obj_09)
(pred_2 obj_02 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_03 obj_12) (pred_1 obj_05 obj_12))))
    (always (not (and (pred_1 obj_03 obj_09) (pred_1 obj_05 obj_09))))
  )
)
)