(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_02 - type_1
obj_14 obj_01 obj_07 obj_13 - type_3
obj_05 obj_12 obj_03 obj_06 - type_2
obj_09 obj_08 obj_11 obj_04 - object)
(:init
(pred_4 obj_10 obj_12)
(pred_2 obj_10 obj_14)
(pred_2 obj_10 obj_01)
(pred_4 obj_02 obj_03)
(pred_2 obj_02 obj_07)
(pred_2 obj_02 obj_13)
(pred_3 obj_09 obj_12)
(pred_3 obj_08 obj_12)
(pred_3 obj_11 obj_03)
(pred_3 obj_04 obj_06)
)
(:goal
(and
(pred_3 obj_09 obj_12)
(pred_3 obj_08 obj_12)
(pred_3 obj_11 obj_12)
(pred_3 obj_04 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_10 obj_12) (pred_4 obj_02 obj_12))))
  )
)
)