(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_04 obj_05 - type_1
obj_07 obj_06 obj_03 obj_10 - type_3
obj_08 obj_01 obj_02 - type_2
obj_09 obj_11 - object)
(:init
(pred_3 obj_04 obj_08)
(pred_4 obj_04 obj_07)
(pred_4 obj_04 obj_06)
(pred_3 obj_05 obj_02)
(pred_4 obj_05 obj_03)
(pred_4 obj_05 obj_10)
(pred_2 obj_09 obj_01)
(pred_2 obj_11 obj_02)
)
(:goal
(and
(pred_2 obj_09 obj_01)
(pred_2 obj_11 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_04 obj_08) (pred_3 obj_05 obj_08))))
  )
)
)