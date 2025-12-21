(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_01 - type_1
obj_08 obj_11 obj_07 obj_12 - type_2
obj_09 obj_02 obj_14 obj_10 - type_3
obj_04 obj_06 obj_05 obj_03 - object)
(:init
(pred_1 obj_13 obj_02)
(pred_3 obj_13 obj_08)
(pred_3 obj_13 obj_11)
(pred_1 obj_01 obj_10)
(pred_3 obj_01 obj_07)
(pred_3 obj_01 obj_12)
(pred_2 obj_04 obj_02)
(pred_2 obj_06 obj_09)
(pred_2 obj_05 obj_02)
(pred_2 obj_03 obj_09)
)
(:goal
(and
(pred_2 obj_04 obj_10)
(pred_2 obj_06 obj_10)
(pred_2 obj_05 obj_09)
(pred_2 obj_03 obj_10)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_13 obj_10) (pred_1 obj_01 obj_10))))
  )
)
)