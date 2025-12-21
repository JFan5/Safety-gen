(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_01 - type_1
obj_09 obj_05 obj_10 obj_14 - type_3
obj_08 obj_02 obj_07 obj_11 - type_2
obj_13 obj_04 obj_03 obj_06 - object)
(:init
(pred_4 obj_12 obj_02)
(pred_2 obj_12 obj_09)
(pred_2 obj_12 obj_05)
(pred_4 obj_01 obj_07)
(pred_2 obj_01 obj_10)
(pred_2 obj_01 obj_14)
(pred_3 obj_13 obj_07)
(pred_3 obj_04 obj_07)
(pred_3 obj_03 obj_02)
(pred_3 obj_06 obj_11)
)
(:goal
(and
(pred_3 obj_13 obj_08)
(pred_3 obj_04 obj_08)
(pred_3 obj_03 obj_08)
(pred_3 obj_06 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_12 obj_08) (pred_4 obj_01 obj_08))))
  )
)
)