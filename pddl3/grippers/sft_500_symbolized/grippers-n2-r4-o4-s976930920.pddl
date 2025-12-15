(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_13 - type_2
obj_12 obj_06 obj_09 obj_11 - type_1
obj_08 obj_02 obj_14 obj_10 - type_3
obj_04 obj_01 obj_07 obj_05 - object)
(:init
(pred_3 obj_03 obj_02)
(pred_1 obj_03 obj_12)
(pred_1 obj_03 obj_06)
(pred_3 obj_13 obj_10)
(pred_1 obj_13 obj_09)
(pred_1 obj_13 obj_11)
(pred_2 obj_04 obj_02)
(pred_2 obj_01 obj_08)
(pred_2 obj_07 obj_14)
(pred_2 obj_05 obj_14)
)
(:goal
(and
(pred_2 obj_04 obj_10)
(pred_2 obj_01 obj_10)
(pred_2 obj_07 obj_14)
(pred_2 obj_05 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_03 obj_10) (pred_3 obj_13 obj_10))))
  )
)
)