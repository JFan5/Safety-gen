(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_02 - type_2
obj_11 obj_03 obj_12 obj_06 - type_1
obj_10 obj_13 obj_08 obj_09 - type_3
obj_04 obj_01 obj_07 - object)
(:init
(pred_4 obj_05 obj_10)
(pred_2 obj_05 obj_11)
(pred_2 obj_05 obj_03)
(pred_4 obj_02 obj_13)
(pred_2 obj_02 obj_12)
(pred_2 obj_02 obj_06)
(pred_3 obj_04 obj_10)
(pred_3 obj_01 obj_08)
(pred_3 obj_07 obj_10)
)
(:goal
(and
(pred_3 obj_04 obj_09)
(pred_3 obj_01 obj_09)
(pred_3 obj_07 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_05 obj_08) (pred_4 obj_02 obj_08))))
    (always (not (and (pred_4 obj_05 obj_09) (pred_4 obj_02 obj_09))))
  )
)
)