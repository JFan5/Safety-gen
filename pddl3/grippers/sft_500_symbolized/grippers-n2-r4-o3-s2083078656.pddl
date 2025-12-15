(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_11 - type_1
obj_03 obj_02 obj_04 obj_12 - type_3
obj_09 obj_07 obj_10 obj_06 - type_2
obj_08 obj_01 obj_05 - object)
(:init
(pred_2 obj_13 obj_06)
(pred_4 obj_13 obj_03)
(pred_4 obj_13 obj_02)
(pred_2 obj_11 obj_07)
(pred_4 obj_11 obj_04)
(pred_4 obj_11 obj_12)
(pred_3 obj_08 obj_07)
(pred_3 obj_01 obj_06)
(pred_3 obj_05 obj_10)
)
(:goal
(and
(pred_3 obj_08 obj_09)
(pred_3 obj_01 obj_07)
(pred_3 obj_05 obj_10)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_13 obj_07) (pred_2 obj_11 obj_07))))
  )
)
)