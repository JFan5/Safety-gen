(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_09 - type_1
obj_12 obj_07 obj_03 obj_08 - type_2
obj_02 obj_05 obj_11 - type_3
obj_10 obj_04 obj_01 - object)
(:init
(pred_4 obj_06 obj_11)
(pred_3 obj_06 obj_12)
(pred_3 obj_06 obj_07)
(pred_4 obj_09 obj_02)
(pred_3 obj_09 obj_03)
(pred_3 obj_09 obj_08)
(pred_2 obj_10 obj_05)
(pred_2 obj_04 obj_02)
(pred_2 obj_01 obj_11)
)
(:goal
(and
(pred_2 obj_10 obj_02)
(pred_2 obj_04 obj_02)
(pred_2 obj_01 obj_05)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_06 obj_05) (pred_4 obj_09 obj_05))))
  )
)
)