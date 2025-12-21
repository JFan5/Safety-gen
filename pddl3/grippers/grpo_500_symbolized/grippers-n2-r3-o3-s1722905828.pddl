(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_01 obj_05 - type_1
obj_09 obj_02 obj_10 obj_07 - type_3
obj_11 obj_08 obj_12 - type_2
obj_04 obj_03 obj_06 - object)
(:init
(pred_4 obj_01 obj_12)
(pred_2 obj_01 obj_09)
(pred_2 obj_01 obj_02)
(pred_4 obj_05 obj_11)
(pred_2 obj_05 obj_10)
(pred_2 obj_05 obj_07)
(pred_3 obj_04 obj_08)
(pred_3 obj_03 obj_08)
(pred_3 obj_06 obj_08)
)
(:goal
(and
(pred_3 obj_04 obj_11)
(pred_3 obj_03 obj_08)
(pred_3 obj_06 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_01 obj_12) (pred_4 obj_05 obj_12))))
  )
)
)