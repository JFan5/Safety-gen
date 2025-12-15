(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_03 obj_09 - type_1
obj_08 obj_07 obj_06 obj_05 - type_3
obj_02 obj_10 obj_11 - type_2
obj_04 obj_01 - object)
(:init
(pred_2 obj_03 obj_11)
(pred_3 obj_03 obj_08)
(pred_3 obj_03 obj_07)
(pred_2 obj_09 obj_02)
(pred_3 obj_09 obj_06)
(pred_3 obj_09 obj_05)
(pred_4 obj_04 obj_11)
(pred_4 obj_01 obj_02)
)
(:goal
(and
(pred_4 obj_04 obj_11)
(pred_4 obj_01 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_03 obj_11) (pred_2 obj_09 obj_11))))
  )
)
)