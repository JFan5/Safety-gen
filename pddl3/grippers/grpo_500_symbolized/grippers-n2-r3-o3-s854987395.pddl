(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_01 - type_1
obj_04 obj_05 obj_02 obj_10 - type_3
obj_07 obj_03 obj_12 - type_2
obj_08 obj_11 obj_06 - object)
(:init
(pred_3 obj_09 obj_03)
(pred_4 obj_09 obj_04)
(pred_4 obj_09 obj_05)
(pred_3 obj_01 obj_07)
(pred_4 obj_01 obj_02)
(pred_4 obj_01 obj_10)
(pred_2 obj_08 obj_07)
(pred_2 obj_11 obj_12)
(pred_2 obj_06 obj_07)
)
(:goal
(and
(pred_2 obj_08 obj_12)
(pred_2 obj_11 obj_07)
(pred_2 obj_06 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_09 obj_12) (pred_3 obj_01 obj_12))))
  )
)
)